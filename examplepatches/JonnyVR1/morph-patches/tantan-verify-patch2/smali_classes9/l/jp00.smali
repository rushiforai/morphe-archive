.class public final synthetic Ll/jp00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pp00;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pp00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jp00;->a:Ll/pp00;

    iput-object p2, p0, Ll/jp00;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jp00;->a:Ll/pp00;

    iget-object p0, p0, Ll/jp00;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/pp00;->d(Ll/pp00;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
