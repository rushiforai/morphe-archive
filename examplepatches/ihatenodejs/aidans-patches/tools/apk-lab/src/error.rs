//! Typed failures mapped onto the Python CLI's six exit classes.
//!
//! Only the five failure classes are representable as errors; success is the
//! absence of an error. The binary boundary converts [`Error`] to an
//! [`ExitCode`] and treats a closed stdout pipe as success.

use crate::models::{ErrorClass, ErrorReport, ExitCode};
use std::fmt;
use std::io;

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Error {
    /// Exit 1: a compatibility verdict or comparison concluded failure.
    Compatibility(String),
    /// Exit 2: malformed command line or unavailable/broken tool.
    Usage(String),
    /// Exit 3: the input artifact is invalid or unsafe.
    InvalidArtifact(String),
    /// Exit 4: host, filesystem, or other infrastructure failed.
    Infrastructure(String),
    /// Exit 5: an otherwise valid operation failed at runtime.
    Runtime(String),
    /// I/O boundary failure. Classified as infrastructure unless the caller
    /// maps a closed pipe to success at the binary boundary.
    Io {
        context: String,
        kind: io::ErrorKind,
    },
}

impl Error {
    #[must_use]
    pub fn compatibility(message: impl Into<String>) -> Self {
        Self::Compatibility(message.into())
    }

    #[must_use]
    pub fn usage(message: impl Into<String>) -> Self {
        Self::Usage(message.into())
    }

    #[must_use]
    pub fn invalid_artifact(message: impl Into<String>) -> Self {
        Self::InvalidArtifact(message.into())
    }

    #[must_use]
    pub fn infrastructure(message: impl Into<String>) -> Self {
        Self::Infrastructure(message.into())
    }

    #[must_use]
    pub fn runtime(message: impl Into<String>) -> Self {
        Self::Runtime(message.into())
    }

    #[must_use]
    pub fn io(context: impl Into<String>, error: io::Error) -> Self {
        Self::Io {
            context: context.into(),
            kind: error.kind(),
        }
    }

    #[must_use]
    pub fn exit_code(&self) -> ExitCode {
        match self {
            Self::Compatibility(_) => ExitCode::CompatibilityFailure,
            Self::Usage(_) => ExitCode::UsageOrToolError,
            Self::InvalidArtifact(_) => ExitCode::InvalidArtifact,
            Self::Infrastructure(_) | Self::Io { .. } => ExitCode::InfrastructureFailure,
            Self::Runtime(_) => ExitCode::RuntimeFailure,
        }
    }

    #[must_use]
    pub fn class(&self) -> ErrorClass {
        match self {
            Self::Compatibility(_) => ErrorClass::Compatibility,
            Self::Usage(_) => ErrorClass::Usage,
            Self::InvalidArtifact(_) => ErrorClass::InvalidArtifact,
            Self::Infrastructure(_) | Self::Io { .. } => ErrorClass::Infrastructure,
            Self::Runtime(_) => ErrorClass::Runtime,
        }
    }

    #[must_use]
    pub fn message(&self) -> String {
        match self {
            Self::Compatibility(message)
            | Self::Usage(message)
            | Self::InvalidArtifact(message)
            | Self::Infrastructure(message)
            | Self::Runtime(message) => message.clone(),
            Self::Io { context, kind } => format!("{context}: {kind:?}"),
        }
    }

    #[must_use]
    pub fn report(&self) -> ErrorReport {
        ErrorReport {
            class: self.class(),
            message: self.message(),
        }
    }

    /// A closed stdout pipe is not an error: the consumer stopped reading and
    /// the process should terminate successfully.
    #[must_use]
    pub fn is_broken_pipe(&self) -> bool {
        matches!(
            self,
            Self::Io {
                kind: io::ErrorKind::BrokenPipe,
                ..
            }
        )
    }
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Compatibility(message)
            | Self::Usage(message)
            | Self::InvalidArtifact(message)
            | Self::Infrastructure(message)
            | Self::Runtime(message) => f.write_str(message),
            Self::Io { context, kind } => write!(f, "{context}: {kind:?}"),
        }
    }
}

impl std::error::Error for Error {}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn each_failure_class_maps_to_its_python_exit_code() {
        assert_eq!(
            Error::compatibility("x").exit_code(),
            ExitCode::CompatibilityFailure
        );
        assert_eq!(Error::usage("x").exit_code(), ExitCode::UsageOrToolError);
        assert_eq!(
            Error::invalid_artifact("x").exit_code(),
            ExitCode::InvalidArtifact
        );
        assert_eq!(
            Error::infrastructure("x").exit_code(),
            ExitCode::InfrastructureFailure
        );
        assert_eq!(Error::runtime("x").exit_code(), ExitCode::RuntimeFailure);
        assert_eq!(
            Error::io("stdout", io::Error::other("boom")).exit_code(),
            ExitCode::InfrastructureFailure
        );
    }

    #[test]
    fn broken_pipe_is_detectable_without_panicking() {
        let error = Error::io(
            "stdout",
            io::Error::new(io::ErrorKind::BrokenPipe, "closed"),
        );
        assert!(error.is_broken_pipe());
        assert!(!Error::usage("no").is_broken_pipe());
        assert_eq!(error.to_string(), "stdout: BrokenPipe");
    }
}
