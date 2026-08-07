.class public final synthetic Ll/oh6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oh6;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/oh6;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oh6;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/oh6;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->i(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method
