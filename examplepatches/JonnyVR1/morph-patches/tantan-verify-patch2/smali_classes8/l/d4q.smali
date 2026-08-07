.class public final synthetic Ll/d4q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/text/SpannableStringBuilder;


# direct methods
.method public synthetic constructor <init>(ILandroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/d4q;->a:I

    iput-object p2, p0, Ll/d4q;->b:Landroid/text/SpannableStringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/d4q;->a:I

    iget-object p0, p0, Ll/d4q;->b:Landroid/text/SpannableStringBuilder;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataHighlightText;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->p(ILandroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataHighlightText;)V

    return-void
.end method
