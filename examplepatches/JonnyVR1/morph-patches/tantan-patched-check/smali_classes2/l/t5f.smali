.class public final synthetic Ll/t5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x5f;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/clevertap/android/sdk/events/EventGroup;

.field public final synthetic d:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Ll/x5f;Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Lorg/json/JSONArray;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5f;->a:Ll/x5f;

    iput-object p2, p0, Ll/t5f;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/t5f;->c:Lcom/clevertap/android/sdk/events/EventGroup;

    iput-object p4, p0, Ll/t5f;->d:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t5f;->a:Ll/x5f;

    iget-object v1, p0, Ll/t5f;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/t5f;->c:Lcom/clevertap/android/sdk/events/EventGroup;

    iget-object p0, p0, Ll/t5f;->d:Lorg/json/JSONArray;

    invoke-static {v0, v1, v2, p0}, Ll/x5f;->m(Ll/x5f;Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Lorg/json/JSONArray;)V

    return-void
.end method
