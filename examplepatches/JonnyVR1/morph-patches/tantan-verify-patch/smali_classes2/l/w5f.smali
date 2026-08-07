.class public final synthetic Ll/w5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/events/EventGroup;

.field public final synthetic b:Ll/x5f;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/events/EventGroup;Ll/x5f;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w5f;->a:Lcom/clevertap/android/sdk/events/EventGroup;

    iput-object p2, p0, Ll/w5f;->b:Ll/x5f;

    iput-object p3, p0, Ll/w5f;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w5f;->a:Lcom/clevertap/android/sdk/events/EventGroup;

    iget-object v1, p0, Ll/w5f;->b:Ll/x5f;

    iget-object p0, p0, Ll/w5f;->c:Landroid/content/Context;

    invoke-static {v0, v1, p0}, Ll/x5f;->o(Lcom/clevertap/android/sdk/events/EventGroup;Ll/x5f;Landroid/content/Context;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
