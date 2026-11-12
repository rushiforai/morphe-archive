.class public interface abstract Lu3l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls3l;

.field public static final b:Ls3l;

.field public static final c:Lo3l;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ls3l;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-direct {v0, v1}, Ls3l;-><init>(Lp6l;)V

    sput-object v0, Lu3l;->a:Ls3l;

    new-instance v0, Ls3l;

    sget-object v1, Lp6l;->b:Lp6l;

    invoke-direct {v0, v1}, Ls3l;-><init>(Lp6l;)V

    sput-object v0, Lu3l;->b:Ls3l;

    new-instance v0, Lo3l;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lu3l;->c:Lo3l;

    return-void
.end method


# virtual methods
.method public abstract a(Lb2l;)Z
.end method
