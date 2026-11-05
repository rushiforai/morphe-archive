.class public final synthetic Le/e/a/VideoMarks119$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/Set;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoMarks119$$ExternalSyntheticLambda13;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/VideoMarks119$$ExternalSyntheticLambda13;->f$1:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/VideoMarks119$$ExternalSyntheticLambda13;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/VideoMarks119$$ExternalSyntheticLambda13;->f$1:Ljava/util/Set;

    invoke-static {v0, v1}, Le/e/a/VideoMarks119;->lambda$5(Ljava/lang/String;Ljava/util/Set;)V

    return-void
.end method
