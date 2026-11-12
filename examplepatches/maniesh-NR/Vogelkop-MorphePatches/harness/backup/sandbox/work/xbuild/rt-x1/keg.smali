.class public final Lkeg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final synthetic b:Lmeg;


# direct methods
.method public constructor <init>(Lmeg;Lcom/opera/android/BrowserActivity;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkeg;->b:Lmeg;

    iput-object p2, p0, Lkeg;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    iget-object p1, p0, Lkeg;->a:Lcom/opera/android/BrowserActivity;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    iget-object p0, p0, Lkeg;->b:Lmeg;

    invoke-virtual {p0}, Lmeg;->a()V

    return-void
.end method
