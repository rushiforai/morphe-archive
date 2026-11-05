.class public final synthetic Le/e/a/Mp4Transfer115$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/Mp4Playlist115$Fetch;


# instance fields
.field public final synthetic f$0:Le/e/a/Mp4Transfer115;


# direct methods
.method public synthetic constructor <init>(Le/e/a/Mp4Transfer115;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Mp4Transfer115$$ExternalSyntheticLambda0;->f$0:Le/e/a/Mp4Transfer115;

    return-void
.end method


# virtual methods
.method public final text(Ljava/net/URL;)Ljava/lang/String;
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/Mp4Transfer115$$ExternalSyntheticLambda0;->f$0:Le/e/a/Mp4Transfer115;

    invoke-virtual {v0, p1}, Le/e/a/Mp4Transfer115;->lambda$0$e-e-a-Mp4Transfer115(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
