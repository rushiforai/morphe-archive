.class public final synthetic Ll/g8y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i8y;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;


# direct methods
.method public synthetic constructor <init>(Ll/i8y;Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g8y;->a:Ll/i8y;

    iput-object p2, p0, Ll/g8y;->b:Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g8y;->a:Ll/i8y;

    iget-object p0, p0, Ll/g8y;->b:Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;

    invoke-static {v0, p0, p1}, Ll/i8y;->i(Ll/i8y;Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;Landroid/view/View;)V

    return-void
.end method
