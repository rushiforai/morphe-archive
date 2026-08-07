.class public final synthetic Ll/ko90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/no90;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/no90;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ko90;->a:Ll/no90;

    iput-boolean p2, p0, Ll/ko90;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ko90;->a:Ll/no90;

    iget-boolean p0, p0, Ll/ko90;->b:Z

    invoke-static {v0, p0, p1}, Ll/no90;->R(Ll/no90;ZLandroid/view/View;)V

    return-void
.end method
