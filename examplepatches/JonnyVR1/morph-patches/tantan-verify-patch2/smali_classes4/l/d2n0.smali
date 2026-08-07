.class public final synthetic Ll/d2n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/f2n0;

.field public final synthetic b:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ll/f2n0;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d2n0;->a:Ll/f2n0;

    iput-object p2, p0, Ll/d2n0;->b:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d2n0;->a:Ll/f2n0;

    iget-object p0, p0, Ll/d2n0;->b:Landroid/app/Activity;

    invoke-static {v0, p0}, Ll/f2n0;->j(Ll/f2n0;Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
