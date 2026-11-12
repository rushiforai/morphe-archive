.class public final synthetic Lcz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwh;


# instance fields
.field public final synthetic a:Lcom/opera/android/browser/chromium/ChromiumContent;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    iput-object p1, p0, Lcz4;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final f(Lo93;)V
    .registers 2

    iget-object p0, p0, Lcz4;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, p1}, Lcom/opera/android/browser/dialog/DialogDelegate;->e(Lo93;)V

    return-void
.end method
