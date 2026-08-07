.class public final synthetic Ll/jww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/sww;


# direct methods
.method public synthetic constructor <init>(Ll/sww;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jww;->a:Ll/sww;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jww;->a:Ll/sww;

    check-cast p1, Ll/bf3;

    check-cast p2, Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    invoke-static {p0, p1, p2}, Ll/sww;->c(Ll/sww;Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;)V

    return-void
.end method
