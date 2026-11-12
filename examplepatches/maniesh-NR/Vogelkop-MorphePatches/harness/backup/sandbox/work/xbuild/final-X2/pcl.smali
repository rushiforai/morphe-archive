.class public final Lpcl;
.super Lou9;
.source "SourceFile"


# static fields
.field public static final b:Lpcl;

.field public static final c:Lpcl;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Lpcl;

    const-string v1, "true"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lpcl;->b:Lpcl;

    new-instance v0, Lpcl;

    const-string v1, "false"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lpcl;->c:Lpcl;

    return-void
.end method
