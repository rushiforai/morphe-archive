.class public Ll/i2c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/i2c;->S()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;

.field public final synthetic b:Ll/i2c;


# direct methods
.method public constructor <init>(Ll/i2c;Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/i2c$a;->b:Ll/i2c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/i2c$a;->a:Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2c$a;->a:Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/DailyPaperAct;->h2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
