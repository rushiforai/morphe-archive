.class public final synthetic Lcom/p1/mobile/android/ui/bubble/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bge$r;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/bubble/BubbleView;

.field public final synthetic b:Lcom/p1/mobile/android/ui/bubble/d$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;Lcom/p1/mobile/android/ui/bubble/d$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/b;->a:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    iput-object p2, p0, Lcom/p1/mobile/android/ui/bubble/b;->b:Lcom/p1/mobile/android/ui/bubble/d$c;

    return-void
.end method


# virtual methods
.method public final a(Ll/bge;FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/b;->a:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/b;->b:Lcom/p1/mobile/android/ui/bubble/d$c;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/android/ui/bubble/d;->b(Lcom/p1/mobile/android/ui/bubble/BubbleView;Lcom/p1/mobile/android/ui/bubble/d$c;Ll/bge;FF)V

    return-void
.end method
