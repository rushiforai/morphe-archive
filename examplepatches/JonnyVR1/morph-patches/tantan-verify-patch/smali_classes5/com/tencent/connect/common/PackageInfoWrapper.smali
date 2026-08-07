.class public Lcom/tencent/connect/common/PackageInfoWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final packageInfo:Landroid/content/pm/PackageInfo;

.field public final packageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/pm/PackageInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/connect/common/PackageInfoWrapper;->packageName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/connect/common/PackageInfoWrapper;->packageInfo:Landroid/content/pm/PackageInfo;

    .line 7
    .line 8
    return-void
.end method
