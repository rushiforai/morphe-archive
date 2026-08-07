.class public final synthetic Ll/pyl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ryl0;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;


# direct methods
.method public synthetic constructor <init>(Ll/ryl0;ILcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pyl0;->a:Ll/ryl0;

    iput p2, p0, Ll/pyl0;->b:I

    iput-object p3, p0, Ll/pyl0;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pyl0;->a:Ll/ryl0;

    iget v1, p0, Ll/pyl0;->b:I

    iget-object p0, p0, Ll/pyl0;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/ryl0;->T3(Ll/ryl0;ILcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;Ljava/lang/Long;)V

    return-void
.end method
