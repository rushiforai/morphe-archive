.class public Lcom/p1/mobile/android/ui/bubble/BubbleView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/bubble/BubbleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/bubble/BubbleView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView$a;->a:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;Ll/ng3;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/bubble/BubbleView$a;-><init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/BubbleView$a;->a:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->e(Lcom/p1/mobile/android/ui/bubble/BubbleView;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
