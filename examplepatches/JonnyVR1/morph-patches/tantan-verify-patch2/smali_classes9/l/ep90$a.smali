.class public Ll/ep90$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ep90;->F(Landroid/view/View;ZZLjava/lang/String;IILjava/lang/String;Ll/y20;Ll/pcj;Ll/x20;Ll/x20;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/ep90;


# direct methods
.method public constructor <init>(Ll/ep90;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ep90$a;->b:Ll/ep90;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ep90$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ep90$a;->a:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
