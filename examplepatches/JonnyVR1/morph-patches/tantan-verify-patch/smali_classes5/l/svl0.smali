.class public final synthetic Ll/svl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ll/yvl0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/MessageLocation;


# direct methods
.method public synthetic constructor <init>(Ll/yvl0;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/svl0;->a:Ll/yvl0;

    iput-object p2, p0, Ll/svl0;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/svl0;->a:Ll/yvl0;

    iget-object v1, p0, Ll/svl0;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Ll/yvl0;->d(Ll/yvl0;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
