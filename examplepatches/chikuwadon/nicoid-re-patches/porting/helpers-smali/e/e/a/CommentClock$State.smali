.class final Le/e/a/CommentClock$State;
.super Ljava/lang/Object;
.source "CommentClock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentClock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field final clock:Le/e/a/CommentClockRules;

.field playing:Ljava/lang/reflect/Method;

.field position:Ljava/lang/reflect/Method;

.field provider:Ljava/lang/reflect/Field;

.field rate:Ljava/lang/reflect/Method;

.field volatile speed:F

.field video:Ljava/lang/reflect/Field;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 7
    .param p1, "view"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Le/e/a/CommentClockRules;

    invoke-direct {v0}, Le/e/a/CommentClockRules;-><init>()V

    iput-object v0, p0, Le/e/a/CommentClock$State;->clock:Le/e/a/CommentClockRules;

    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Le/e/a/CommentClock$State;->speed:F

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "e.e.a.u"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    const-string v1, "D"

    goto :goto_27

    :cond_25
    const-string v1, "E"

    :goto_27
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iput-object v0, p0, Le/e/a/CommentClock$State;->provider:Ljava/lang/reflect/Field;

    .line 15
    iget-object v0, p0, Le/e/a/CommentClock$State;->provider:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "a"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Le/e/a/CommentClock$State;->position:Ljava/lang/reflect/Method;

    const-string v2, "c"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Le/e/a/CommentClock$State;->playing:Ljava/lang/reflect/Method;

    .line 16
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    iput-object v2, p0, Le/e/a/CommentClock$State;->video:Ljava/lang/reflect/Field;

    iget-object v2, p0, Le/e/a/CommentClock$State;->video:Ljava/lang/reflect/Field;

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getPlaybackSpeed"

    new-array v1, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentClock$State;->rate:Ljava/lang/reflect/Method;

    .line 17
    return-void
.end method
