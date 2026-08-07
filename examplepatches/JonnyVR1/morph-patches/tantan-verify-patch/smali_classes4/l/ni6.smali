.class public final synthetic Ll/ni6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ni6;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ni6;->a:Lcom/p1/mobile/android/app/Act;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->f(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
