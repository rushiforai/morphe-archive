use std::io::Write;
use std::process::ExitCode;

fn main() -> ExitCode {
    apk_lab::process::install_signal_handlers();
    let args: Vec<std::ffi::OsString> = std::env::args_os().skip(1).collect();

    match apk_lab::cli::run(&args) {
        Ok(_) if apk_lab::process::termination_requested() => interrupted_exit(),
        Ok(code) => ExitCode::from(code.as_u8()),
        Err(error) if error.is_broken_pipe() && !apk_lab::process::termination_requested() => {
            ExitCode::SUCCESS
        }
        Err(error) => {
            let mut stderr = std::io::stderr().lock();
            let _ = writeln!(stderr, "apk-lab: {error}");
            let _ = stderr.flush();
            if apk_lab::process::termination_requested() {
                return interrupted_exit();
            }
            ExitCode::from(error.exit_code().as_u8())
        }
    }
}

/// Cancellation always exits through the runtime-failure class after RAII
/// cleanup has run, so callers can distinguish an interrupted run from a
/// tool's own failure status.
fn interrupted_exit() -> ExitCode {
    let mut stderr = std::io::stderr().lock();
    let _ = writeln!(stderr, "apk-lab: interrupted");
    let _ = stderr.flush();
    ExitCode::from(apk_lab::models::ExitCode::RuntimeFailure.as_u8())
}
