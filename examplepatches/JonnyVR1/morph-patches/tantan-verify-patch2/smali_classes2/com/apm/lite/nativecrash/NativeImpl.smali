.class public Lcom/apm/lite/nativecrash/NativeImpl;
.super Ljava/lang/Object;


# static fields
.field private static sResendSigQuit:Z = true

.field private static volatile soLoaded:Z

.field private static volatile soLoadedSuccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->v()V

    return-void
.end method

.method public static b(I)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doCloseFile(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static c()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->doCreateCallbackThread()I

    move-result v0

    return v0
.end method

.method public static d(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doDump(Ljava/lang/String;)V

    return-void
.end method

.method private static native doCheckNativeCrash()Z
.end method

.method private static native doCloseFile(I)V
.end method

.method private static native doCreateCallbackThread()I
.end method

.method private static native doDump(Ljava/lang/String;)V
.end method

.method private static native doDumpFds(Ljava/lang/String;)V
.end method

.method private static native doDumpHprof(Ljava/lang/String;)V
.end method

.method private static native doDumpLogcat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private static native doDumpMaps(Ljava/lang/String;)V
.end method

.method private static native doDumpMemInfo(Ljava/lang/String;)V
.end method

.method private static native doDumpThreads(Ljava/lang/String;)V
.end method

.method private static native doGetAppCpuTime()J
.end method

.method private static native doGetChildCpuTime()J
.end method

.method private static native doGetCrashHeader(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static native doGetDeviceCpuTime()J
.end method

.method private static native doGetFDCount()I
.end method

.method private static native doGetFdDump(II[I[Ljava/lang/String;)[Ljava/lang/String;
.end method

.method private static native doGetFreeMemory()J
.end method

.method private static native doGetThreadCpuTime(I)J
.end method

.method private static native doGetThreadsCount()I
.end method

.method private static native doGetTotalMemory()J
.end method

.method private static native doGetVMSize()J
.end method

.method private static native doInitThreadDump()V
.end method

.method private static native doLock(Ljava/lang/String;I)I
.end method

.method private static native doOpenFile(Ljava/lang/String;)I
.end method

.method private static native doRebuildTombstone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private static native doSetAlogConfigPath(Ljava/lang/String;)V
.end method

.method private static native doSetAlogFlushAddr(J)V
.end method

.method private static native doSetAlogLogDirAddr(J)V
.end method

.method private static native doSetResendSigQuit(I)V
.end method

.method private static native doSetUploadEnd()V
.end method

.method private static native doSignalMainThread()V
.end method

.method private static native doStart(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I
.end method

.method private static native doStartAnrMonitor(I)V
.end method

.method private static native doWriteFile(ILjava/lang/String;I)V
.end method

.method public static e(Ljava/lang/String;)I
    .locals 2

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-static {p0, v1}, Lcom/apm/lite/nativecrash/NativeImpl;->doLock(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    :catchall_0
    :cond_1
    :goto_0
    return v1
.end method

.method public static f(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doDumpFds(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/apm/lite/nativecrash/NativeImpl;->doDumpLogcat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static h(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doDumpMaps(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doDumpMemInfo(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method private static native is64Bit()Z
.end method

.method public static j(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doDumpThreads(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static k()Z
    .locals 2

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->doCheckNativeCrash()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    return v1
.end method

.method public static l(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doGetCrashHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static m()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->doInitThreadDump()V

    return-void
.end method

.method public static n()Z
    .locals 2

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->is64Bit()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    return v1
.end method

.method public static o()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->sResendSigQuit:Z

    return v0
.end method

.method public static p()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoaded:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    return v0

    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoaded:Z

    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_1

    const-string v0, "apmlitea"

    invoke-static {v0}, Ll/b6r0;->a(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    :cond_1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    return v0
.end method

.method public static q(Ljava/lang/String;)I
    .locals 2

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doOpenFile(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    :catchall_0
    return v1
.end method

.method public static r(Ljava/io/File;)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Ll/j5r0;->m(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Ll/j5r0;->p(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Ll/j5r0;->i(Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, v1}, Lcom/apm/lite/nativecrash/NativeImpl;->doRebuildTombstone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static s()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->doSignalMainThread()V

    return-void
.end method

.method public static t(Z)V
    .locals 1

    .line 1
    sput-boolean p0, Lcom/apm/lite/nativecrash/NativeImpl;->sResendSigQuit:Z

    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doSetResendSigQuit(I)V

    return-void
.end method

.method public static u()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->doSetUploadEnd()V

    return-void
.end method

.method private static v()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Lcom/apm/lite/nativecrash/NativeImpl;->doStartAnrMonitor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :goto_0
    return-void
.end method

.method public static w(Landroid/content/Context;)Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->p()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ll/j5r0;->E(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/apmlite"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const-string v4, "libapmliteb.so"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-static {}, Ll/fuq0;->a()Ljava/lang/String;

    move-result-object p0

    const-string v2, "apmliteb"

    invoke-static {v2}, Ll/fuq0;->d(Ljava/lang/String;)V

    :goto_0
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Ll/n0r0;->n()I

    move-result v3

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v4, p0, v1, v2, v3}, Lcom/apm/lite/nativecrash/NativeImpl;->doStart(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    :cond_1
    return v0
.end method

.method public static x()V
    .locals 2

    .line 1
    new-instance v0, Lcom/apm/lite/nativecrash/NativeImpl$a;

    invoke-direct {v0}, Lcom/apm/lite/nativecrash/NativeImpl$a;-><init>()V

    const-string v1, "NPTH-AnrMonitor"

    invoke-static {v0, v1}, Ll/n6r0;->a(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    return-void
.end method

.method public static y(I)I
    .locals 2

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    if-gez p0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v0, ""

    invoke-static {v0, p0}, Lcom/apm/lite/nativecrash/NativeImpl;->doLock(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    :catchall_0
    :cond_1
    :goto_0
    return v1
.end method

.method public static z(ILjava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/apm/lite/nativecrash/NativeImpl;->soLoadedSuccess:Z

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/apm/lite/nativecrash/NativeImpl;->doWriteFile(ILjava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_1
    :goto_0
    return-void
.end method
