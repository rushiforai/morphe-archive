.class public final synthetic Ll/aqh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bqh;

.field public final synthetic b:Ll/cqh;


# direct methods
.method public synthetic constructor <init>(Ll/bqh;Ll/cqh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aqh;->a:Ll/bqh;

    iput-object p2, p0, Ll/aqh;->b:Ll/cqh;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aqh;->a:Ll/bqh;

    iget-object p0, p0, Ll/aqh;->b:Ll/cqh;

    invoke-static {v0, p0, p1}, Ll/bqh;->F(Ll/bqh;Ll/cqh;Landroid/view/View;)V

    return-void
.end method
