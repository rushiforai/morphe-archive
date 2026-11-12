.class public final Lqcl;
.super Lou9;
.source "SourceFile"


# static fields
.field public static final b:Lqcl;

.field public static final c:Lqcl;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Lqcl;

    const-string v1, "true"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lqcl;->b:Lqcl;

    new-instance v0, Lqcl;

    const-string v1, "false"

    invoke-direct {v0, v1}, Lou9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lqcl;->c:Lqcl;

    return-void
.end method
