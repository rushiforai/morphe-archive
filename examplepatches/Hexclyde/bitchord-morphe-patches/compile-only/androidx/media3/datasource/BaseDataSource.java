package androidx.media3.datasource;

public abstract class BaseDataSource implements DataSource {
    public BaseDataSource(boolean network) {}

    public final void addTransferListener(TransferListener l) {}

    protected final void transferInitializing(DataSpec s) {}

    protected final void transferStarted(DataSpec s) {}

    protected final void bytesTransferred(int n) {}

    protected final void transferEnded() {}
}
