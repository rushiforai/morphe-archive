.class public final synthetic Ll/n3f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/s3f;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$BooleanRef;


# direct methods
.method public synthetic constructor <init>(Ll/s3f;Lkotlin/jvm/internal/Ref$BooleanRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n3f;->a:Ll/s3f;

    iput-object p2, p0, Ll/n3f;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n3f;->a:Ll/s3f;

    iget-object p0, p0, Ll/n3f;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {v0, p0, p1}, Ll/s3f;->c(Ll/s3f;Lkotlin/jvm/internal/Ref$BooleanRef;Lorg/json/JSONObject;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
