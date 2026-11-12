.class public final Lgbl;
.super Le55;
.source "SourceFile"


# static fields
.field public static final b:Ldvj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldvj;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ldvj;-><init>(B)V

    sput-object v0, Lgbl;->b:Ldvj;

    return-void
.end method
