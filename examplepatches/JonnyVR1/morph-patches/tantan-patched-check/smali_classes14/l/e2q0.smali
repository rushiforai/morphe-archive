.class public final synthetic Ll/e2q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ljava/lang/Runnable;

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e2q0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/e2q0;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/e2q0;->c:Ljava/lang/Runnable;

    iput-object p4, p0, Ll/e2q0;->d:Ljava/lang/Runnable;

    iput-object p5, p0, Ll/e2q0;->e:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e2q0;->a:Ll/v3q0;

    iget-object v1, p0, Ll/e2q0;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Ll/e2q0;->c:Ljava/lang/Runnable;

    iget-object v3, p0, Ll/e2q0;->d:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/e2q0;->e:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p0}, Ll/v3q0;->X2(Ll/v3q0;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method
