.class public final synthetic Ll/txb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/cryption/b;

.field public final synthetic b:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

.field public final synthetic c:Lkotlin/jvm/internal/Ref$BooleanRef;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/cryption/b;Lcom/clevertap/android/sdk/cryption/EncryptionLevel;Lkotlin/jvm/internal/Ref$BooleanRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/txb;->a:Lcom/clevertap/android/sdk/cryption/b;

    iput-object p2, p0, Ll/txb;->b:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    iput-object p3, p0, Ll/txb;->c:Lkotlin/jvm/internal/Ref$BooleanRef;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/txb;->a:Lcom/clevertap/android/sdk/cryption/b;

    iget-object v1, p0, Ll/txb;->b:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    iget-object p0, p0, Ll/txb;->c:Lkotlin/jvm/internal/Ref$BooleanRef;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/clevertap/android/sdk/cryption/b;->a(Lcom/clevertap/android/sdk/cryption/b;Lcom/clevertap/android/sdk/cryption/EncryptionLevel;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
