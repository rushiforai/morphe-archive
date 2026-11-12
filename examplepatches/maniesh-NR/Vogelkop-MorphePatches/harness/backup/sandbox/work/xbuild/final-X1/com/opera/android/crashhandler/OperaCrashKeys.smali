.class public final Lcom/opera/android/crashhandler/OperaCrashKeys;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:[Ljava/lang/String;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReferenceArray;

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 51

    const-string v49, "WebView_Package"

    const-string v50, "WebView_Version"

    const-string v1, "Android_App_Abi"

    const-string v2, "Android_OS_Version"

    const-string v3, "Android_Package_Name"

    const-string v4, "BuildID"

    const-string v5, "InstallTime"

    const-string v6, "OperaReleaseChannel"

    const-string v7, "ProcessType"

    const-string v8, "ProductName"

    const-string v9, "ProductId"

    const-string v10, "StartupTime"

    const-string v11, "Version"

    const-string v12, "Version_Name"

    const-string v13, "mapping-package"

    const-string v14, "symbols-package"

    const-string v15, "UBN"

    const-string v16, "BreamBuildFolder"

    const-string v17, "ProguardMappingsId"

    const-string v18, "UseProguardMappingsId"

    const-string v19, "AB_Group"

    const-string v20, "AdapterDeviceID"

    const-string v21, "AdapterVendorID"

    const-string v22, "Android_CPU_ABI"

    const-string v23, "Android_Manufacturer"

    const-string v24, "Android_Model"

    const-string v25, "Android_Version"

    const-string v26, "Apk_Install_Time"

    const-string v27, "Apk_Update_Time"

    const-string v28, "Config_Bundle"

    const-string v29, "Default_Branding"

    const-string v30, "Distribution_Source"

    const-string v31, "Distribution_Medium"

    const-string v32, "Dpi"

    const-string v33, "Emulated_Modules"

    const-string v34, "Host_Platform"

    const-string v35, "Install_Referrer"

    const-string v36, "Installation_ID"

    const-string v37, "Installed_Modules"

    const-string v38, "Java_Heap_Limit"

    const-string v39, "Lifecyle_Status"

    const-string v40, "Locales"

    const-string v41, "Mini_Server_Host"

    const-string v42, "Power_Save_Mode"

    const-string v43, "Premium_State"

    const-string v44, "Previous_Version_Code"

    const-string v45, "Session_Db_Init_Result"

    const-string v46, "URL"

    const-string v47, "User_Agent"

    const-string v48, "Version_Code"

    filled-new-array/range {v1 .. v50}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/opera/android/crashhandler/OperaCrashKeys;->c:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    iput-object v0, p0, Lcom/opera/android/crashhandler/OperaCrashKeys;->a:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    return-void
.end method

.method public static makeUrlFitForFeedbackOrStats(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Laik;->a:[Ljava/lang/String;

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_f

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_f
    invoke-static {p0}, Laik;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(ILjava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/crashhandler/OperaCrashKeys;->a:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    iget-boolean p0, p0, Lcom/opera/android/crashhandler/OperaCrashKeys;->b:Z

    if-eqz p0, :cond_c

    invoke-static {p1, p2}, LJ/N;->MDEEK5$i(ILjava/lang/Object;)V

    :cond_c
    return-void
.end method
