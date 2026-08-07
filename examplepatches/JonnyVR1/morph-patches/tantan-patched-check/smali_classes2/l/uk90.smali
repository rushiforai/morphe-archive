.class public final synthetic Ll/uk90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/work/impl/a;

.field public final synthetic b:Ll/piq0;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/a;Ll/piq0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uk90;->a:Landroidx/work/impl/a;

    iput-object p2, p0, Ll/uk90;->b:Ll/piq0;

    iput-boolean p3, p0, Ll/uk90;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uk90;->a:Landroidx/work/impl/a;

    iget-object v1, p0, Ll/uk90;->b:Ll/piq0;

    iget-boolean p0, p0, Ll/uk90;->c:Z

    invoke-static {v0, v1, p0}, Landroidx/work/impl/a;->c(Landroidx/work/impl/a;Ll/piq0;Z)V

    return-void
.end method
