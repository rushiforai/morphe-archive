.class public final synthetic Ll/hgi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/igi0;

.field public final synthetic b:Ll/l4g0;

.field public final synthetic c:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Ll/igi0;Ll/l4g0;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hgi0;->a:Ll/igi0;

    iput-object p2, p0, Ll/hgi0;->b:Ll/l4g0;

    iput-object p3, p0, Ll/hgi0;->c:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hgi0;->a:Ll/igi0;

    iget-object v1, p0, Ll/hgi0;->b:Ll/l4g0;

    iget-object p0, p0, Ll/hgi0;->c:Ll/xc00;

    invoke-static {v0, v1, p0}, Ll/igi0;->M(Ll/igi0;Ll/l4g0;Ll/xc00;)V

    return-void
.end method
