use std::fmt::{self, Display};

#[derive(Debug)]
pub enum AssetError {
    Usage(String),
    Failure(String),
}

impl AssetError {
    pub fn usage(message: impl Display) -> Self {
        Self::Usage(message.to_string())
    }

    pub fn failure(message: impl Display) -> Self {
        Self::Failure(message.to_string())
    }

    pub fn exit_code(&self) -> i32 {
        match self {
            Self::Usage(_) => 2,
            Self::Failure(_) => 1,
        }
    }
}

impl Display for AssetError {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Usage(message) | Self::Failure(message) => formatter.write_str(message),
        }
    }
}

impl std::error::Error for AssetError {}

impl From<std::io::Error> for AssetError {
    fn from(error: std::io::Error) -> Self {
        Self::failure(error)
    }
}

pub type Result<T, E = AssetError> = std::result::Result<T, E>;
