.class public abstract Lt2g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/browser/SimpleUrlLoader;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lx2g;Ljava/lang/String;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "gaid"

    iget-object v2, p2, Lx2g;->a:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "personalized"

    iget-boolean v2, p2, Lx2g;->b:Z

    invoke-virtual {v0, v1, v2}, Lorb;->r(Ljava/lang/String;Z)V

    const-string v1, "countryCode"

    iget-object v2, p2, Lx2g;->c:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "abGroup"

    iget-object v2, p2, Lx2g;->d:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "platform"

    iget-object p2, p2, Lx2g;->e:Ljava/lang/String;

    invoke-virtual {v0, p2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p2, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Lkqd;

    const/16 p2, 0x1c

    invoke-direct {v5, p0, p2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lcom/opera/android/browser/SimpleUrlLoader;

    const-string v4, "application/json"

    move-object v2, p1

    move-object v1, p3

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/browser/SimpleUrlLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;)V

    iget-wide p1, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    const-wide/16 v1, 0x0

    cmp-long p3, p1, v1

    if-eqz p3, :cond_4e

    const/16 p3, 0x1e

    invoke-static {p1, p2, p3}, LJ/N;->M71SD119(JI)V

    :cond_4e
    iput-object v0, p0, Lt2g;->a:Lcom/opera/android/browser/SimpleUrlLoader;

    return-void
.end method

.method public static a(Lorb;JJ)Ll2g;
    .registers 21

    move-object/from16 v0, p0

    new-instance v1, Ll2g;

    iget-object v2, v0, Lorb;->a:Lorg/json/JSONObject;

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "targetURL"

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "domainURL"

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "title"

    invoke-virtual {v0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "iconURL"

    invoke-virtual {v0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "globalScore"

    const-wide/16 v8, 0x0

    invoke-virtual {v2, v0, v8, v9}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v12

    const-string v0, "autocompleteChars"

    const/4 v8, 0x2

    invoke-virtual {v2, v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    const-string v0, "recommendChars"

    invoke-virtual {v2, v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v15

    move-object v0, v1

    move v1, v3

    move-object v2, v4

    move-object v3, v5

    move-object v4, v6

    const-wide/16 v5, 0x0

    move-wide/from16 v8, p1

    move-wide/from16 v10, p3

    invoke-direct/range {v0 .. v15}, Ll2g;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;JJDII)V

    return-object v0
.end method
