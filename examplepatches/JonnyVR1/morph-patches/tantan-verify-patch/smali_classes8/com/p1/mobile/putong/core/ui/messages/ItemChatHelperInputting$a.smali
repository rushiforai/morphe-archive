.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->j0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->h0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    rem-int/lit8 v1, v1, 0x3

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->k0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->h0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->i0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    array-length v1, v1

    .line 34
    const-string v2, "\u5bf9\u65b9\u6b63\u5728\u8f93\u5165"

    .line 35
    .line 36
    if-ge v0, v1, :cond_1

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->i0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)[Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 50
    .line 51
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->h0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    aget-object v1, v1, v2

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->j0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)Lv/VText;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 74
    .line 75
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->h0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/lit8 v1, v1, 0x1

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->k0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;

    .line 90
    .line 91
    const-wide/16 v1, 0x12c

    .line 92
    .line 93
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 94
    .line 95
    .line 96
    return-void
.end method
