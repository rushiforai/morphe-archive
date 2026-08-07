.class public final synthetic Ll/q1b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function4;


# instance fields
.field public final synthetic a:Ll/r1b0;

.field public final synthetic b:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;


# direct methods
.method public synthetic constructor <init>(Ll/r1b0;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q1b0;->a:Ll/r1b0;

    iput-object p2, p0, Ll/q1b0;->b:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/q1b0;->a:Ll/r1b0;

    iget-object v1, p0, Ll/q1b0;->b:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    move-object v2, p1

    check-cast v2, Lorg/json/JSONObject;

    move-object v3, p2

    check-cast v3, Lorg/json/JSONObject;

    move-object v4, p3

    check-cast v4, Ljava/lang/String;

    move-object v5, p4

    check-cast v5, Ljava/util/Map;

    invoke-static/range {v0 .. v5}, Ll/r1b0;->a(Ll/r1b0;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/Map;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
