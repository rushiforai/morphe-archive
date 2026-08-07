.class public final synthetic Ll/x85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/CleverTapAPI;

.field public final synthetic b:Ll/mm50;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/CleverTapAPI;Ll/mm50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x85;->a:Lcom/clevertap/android/sdk/CleverTapAPI;

    iput-object p2, p0, Ll/x85;->b:Ll/mm50;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x85;->a:Lcom/clevertap/android/sdk/CleverTapAPI;

    iget-object p0, p0, Ll/x85;->b:Ll/mm50;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/CleverTapAPI;->d(Lcom/clevertap/android/sdk/CleverTapAPI;Ll/mm50;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
