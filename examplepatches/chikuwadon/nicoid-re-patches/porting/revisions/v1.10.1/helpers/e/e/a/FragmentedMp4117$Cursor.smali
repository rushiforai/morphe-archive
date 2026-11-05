.class final Le/e/a/FragmentedMp4117$Cursor;
.super Ljava/lang/Object;
.source "FragmentedMp4117.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FragmentedMp4117;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Cursor"
.end annotation


# instance fields
.field buffer:[B

.field decode:J

.field final format:Le/e/a/FragmentedMp4117$Format;

.field fragment:I

.field index:I

.field sample:Le/e/a/FragmentedMp4117$Sample;

.field final samples:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/FragmentedMp4117$Sample;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Le/e/a/FragmentedMp4117;


# direct methods
.method constructor <init>(Le/e/a/FragmentedMp4117;Le/e/a/FragmentedMp4117$Format;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    iput-object p1, p0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Le/e/a/FragmentedMp4117$Cursor;->samples:Ljava/util/ArrayList;

    const/4 p1, 0x0

    new-array p1, p1, [B

    iput-object p1, p0, Le/e/a/FragmentedMp4117$Cursor;->buffer:[B

    iput-object p2, p0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    invoke-virtual {p0}, Le/e/a/FragmentedMp4117$Cursor;->advance()Z

    return-void
.end method


# virtual methods
.method advance()Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_5a

    iget v0, p0, Le/e/a/FragmentedMp4117$Cursor;->index:I

    iget-object v1, p0, Le/e/a/FragmentedMp4117$Cursor;->samples:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_26

    :goto_15
    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->samples:Ljava/util/ArrayList;

    iget v1, p0, Le/e/a/FragmentedMp4117$Cursor;->index:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Le/e/a/FragmentedMp4117$Cursor;->index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FragmentedMp4117$Sample;

    iput-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    return v2

    :cond_26
    iget v0, p0, Le/e/a/FragmentedMp4117$Cursor;->fragment:I

    iget-object v1, p0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v1, v1, Le/e/a/FragmentedMp4117;->fragments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_37

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    return v3

    :cond_37
    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->samples:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iput v3, p0, Le/e/a/FragmentedMp4117$Cursor;->index:I

    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v0, v0, Le/e/a/FragmentedMp4117;->fragments:Ljava/util/List;

    iget v1, p0, Le/e/a/FragmentedMp4117$Cursor;->fragment:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Le/e/a/FragmentedMp4117$Cursor;->fragment:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FragmentedMp4117$Box;

    invoke-virtual {p0, v0}, Le/e/a/FragmentedMp4117$Cursor;->parse(Le/e/a/FragmentedMp4117$Box;)V

    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->samples:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_26

    goto :goto_15

    :cond_5a
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0
.end method

.method parse(Le/e/a/FragmentedMp4117$Box;)V
    .registers 43
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-wide v3, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v5, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v2, v3, v4, v5, v6}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_19

    .line 28
    return-void

    .line 26
    :cond_19
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/FragmentedMp4117$Box;

    iget-object v4, v3, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v5, "traf"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_31c

    iget-object v4, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-wide v5, v3, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v7, v3, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v4, v5, v6, v7, v8}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v3

    const-string v4, "tfhd"

    invoke-static {v3, v4}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v4

    if-eqz v4, :cond_314

    iget-object v5, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v5, v4}, Le/e/a/FragmentedMp4117;->flags(Le/e/a/FragmentedMp4117$Box;)I

    move-result v5

    const v6, 0xffffff

    and-int/2addr v5, v6

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    const-wide/16 v8, 0x8

    invoke-virtual {v7, v4, v8, v9}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v7, v7, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v10, v4, Le/e/a/FragmentedMp4117$Box;->data:J

    const-wide/16 v12, 0x4

    add-long/2addr v10, v12

    invoke-virtual {v7, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v7}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v10

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget-wide v14, v7, Le/e/a/FragmentedMp4117$Format;->id:J

    cmp-long v7, v10, v14

    if-eqz v7, :cond_67

    goto :goto_12

    :cond_67
    const-string v7, "senc"

    invoke-static {v3, v7}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v7

    if-nez v7, :cond_30c

    iget-wide v10, v1, Le/e/a/FragmentedMp4117$Box;->start:J

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget-wide v14, v7, Le/e/a/FragmentedMp4117$Format;->defaultDuration:J

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget-wide v8, v7, Le/e/a/FragmentedMp4117$Format;->defaultSize:J

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget-wide v6, v7, Le/e/a/FragmentedMp4117$Format;->defaultFlags:J

    and-int/lit8 v16, v5, 0x1

    if-eqz v16, :cond_89

    iget-object v10, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v10, v10, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v10

    :cond_89
    and-int/lit8 v16, v5, 0x2

    if-eqz v16, :cond_a2

    iget-object v12, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v12}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v12

    const-wide/16 v18, 0x1

    cmp-long v12, v12, v18

    if-nez v12, :cond_9a

    goto :goto_a2

    :cond_9a
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u5f62\u5f0f\u5207\u66ff\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_a2
    :goto_a2
    and-int/lit8 v12, v5, 0x8

    if-eqz v12, :cond_ac

    iget-object v12, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v12}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v14

    :cond_ac
    and-int/lit8 v12, v5, 0x10

    if-eqz v12, :cond_b6

    iget-object v8, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v8}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v8

    :cond_b6
    and-int/lit8 v5, v5, 0x20

    if-eqz v5, :cond_c0

    iget-object v5, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v5}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v6

    :cond_c0
    iget-object v5, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v5, v5, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v5}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v12

    iget-wide v4, v4, Le/e/a/FragmentedMp4117$Box;->end:J

    cmp-long v4, v12, v4

    if-gtz v4, :cond_304

    const-string v4, "tfdt"

    invoke-static {v3, v4}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v4

    const/4 v5, 0x1

    if-eqz v4, :cond_12c

    iget-object v12, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v12, v4}, Le/e/a/FragmentedMp4117;->flags(Le/e/a/FragmentedMp4117$Box;)I

    move-result v12

    ushr-int/lit8 v12, v12, 0x18

    if-gt v12, v5, :cond_124

    iget-object v13, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    if-ne v12, v5, :cond_e8

    const/16 v20, 0xc

    goto :goto_ea

    :cond_e8
    const/16 v20, 0x8

    :goto_ea
    move/from16 v5, v20

    move-wide/from16 v21, v6

    int-to-long v5, v5

    invoke-virtual {v13, v4, v5, v6}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v5, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v5, v5, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v6, v4, Le/e/a/FragmentedMp4117$Box;->data:J

    const-wide/16 v16, 0x4

    add-long v6, v6, v16

    invoke-virtual {v5, v6, v7}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 v4, 0x1

    if-ne v12, v4, :cond_10b

    iget-object v4, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v4, v4, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v4

    goto :goto_111

    :cond_10b
    iget-object v4, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v4}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v4

    :goto_111
    iput-wide v4, v0, Le/e/a/FragmentedMp4117$Cursor;->decode:J

    iget-wide v4, v0, Le/e/a/FragmentedMp4117$Cursor;->decode:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_11c

    goto :goto_12e

    :cond_11c
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u5fa9\u53f7\u6642\u523b\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_124
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u6642\u523b\u306e\u5f62\u5f0f\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_12c
    move-wide/from16 v21, v6

    :goto_12e
    iget-object v4, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v4, v1}, Le/e/a/FragmentedMp4117;->nextMdat(Le/e/a/FragmentedMp4117$Box;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v4

    iget-wide v4, v4, Le/e/a/FragmentedMp4117$Box;->data:J

    .line 27
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_13a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_142

    goto/16 :goto_12

    :cond_142
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/FragmentedMp4117$Box;

    iget-object v7, v6, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v12, "trun"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2f4

    iget-object v7, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v7, v6}, Le/e/a/FragmentedMp4117;->flags(Le/e/a/FragmentedMp4117$Box;)I

    move-result v7

    ushr-int/lit8 v12, v7, 0x18

    const v13, 0xffffff

    and-int/2addr v7, v13

    const/4 v13, 0x1

    if-gt v12, v13, :cond_2ec

    iget-object v13, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    move-object/from16 v20, v2

    const-wide/16 v1, 0x8

    invoke-virtual {v13, v6, v1, v2}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v13, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v13, v13, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v1, v6, Le/e/a/FragmentedMp4117$Box;->data:J

    const-wide/16 v16, 0x4

    add-long v1, v1, v16

    invoke-virtual {v13, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v1, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v1}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v1

    const-wide/32 v23, 0x30d40

    cmp-long v13, v1, v23

    if-gtz v13, :cond_2e4

    and-int/lit8 v13, v7, 0x1

    if-eqz v13, :cond_195

    iget-object v4, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v4, v4, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v4

    int-to-long v4, v4

    invoke-static {v10, v11, v4, v5}, Le/e/a/FragmentedMp4117;->add(JJ)J

    move-result-wide v4

    :cond_195
    and-int/lit8 v13, v7, 0x4

    if-eqz v13, :cond_1a0

    iget-object v13, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v13}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v23

    goto :goto_1a2

    :cond_1a0
    move-wide/from16 v23, v21

    :goto_1a2
    and-int/lit16 v13, v7, 0x100

    const/16 v25, 0x4

    const/16 v26, 0x0

    if-eqz v13, :cond_1ad

    move/from16 v27, v25

    goto :goto_1af

    :cond_1ad
    move/from16 v27, v26

    :goto_1af
    move-object/from16 v28, v3

    and-int/lit16 v3, v7, 0x200

    if-eqz v3, :cond_1b8

    move/from16 v29, v25

    goto :goto_1ba

    :cond_1b8
    move/from16 v29, v26

    :goto_1ba
    add-int v27, v27, v29

    move-wide/from16 v29, v4

    and-int/lit16 v4, v7, 0x400

    if-eqz v4, :cond_1c5

    move/from16 v5, v25

    goto :goto_1c7

    :cond_1c5
    move/from16 v5, v26

    :goto_1c7
    add-int v27, v27, v5

    and-int/lit16 v5, v7, 0x800

    if-eqz v5, :cond_1ce

    goto :goto_1d0

    :cond_1ce
    move/from16 v25, v26

    :goto_1d0
    add-int v7, v27, v25

    move-wide/from16 v31, v8

    int-to-long v7, v7

    mul-long/2addr v7, v1

    move-wide/from16 v33, v10

    iget-wide v9, v6, Le/e/a/FragmentedMp4117$Box;->end:J

    iget-object v6, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v6, v6, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v35

    sub-long v9, v9, v35

    cmp-long v6, v7, v9

    if-gtz v6, :cond_2dc

    move/from16 v8, v26

    move-wide/from16 v6, v29

    :goto_1ec
    int-to-long v9, v8

    cmp-long v9, v9, v1

    if-ltz v9, :cond_1fe

    move-object/from16 v1, p1

    move-wide v4, v6

    move-object/from16 v2, v20

    move-object/from16 v3, v28

    move-wide/from16 v8, v31

    move-wide/from16 v10, v33

    goto/16 :goto_13a

    :cond_1fe
    if-eqz v13, :cond_207

    iget-object v9, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v9}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v9

    goto :goto_208

    :cond_207
    move-wide v9, v14

    :goto_208
    if-eqz v3, :cond_217

    iget-object v11, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v11}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v29

    move-wide/from16 v39, v1

    move-wide/from16 v1, v29

    move-wide/from16 v29, v39

    goto :goto_21b

    :cond_217
    move-wide/from16 v29, v1

    move-wide/from16 v1, v31

    :goto_21b
    if-eqz v4, :cond_224

    iget-object v11, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v11}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v35

    goto :goto_22b

    :cond_224
    if-nez v8, :cond_229

    move-wide/from16 v35, v23

    goto :goto_22b

    :cond_229
    move-wide/from16 v35, v21

    :goto_22b
    if-eqz v5, :cond_249

    const/4 v11, 0x1

    if-ne v12, v11, :cond_23e

    iget-object v11, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v11, v11, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v11}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v11

    move/from16 v25, v3

    move/from16 v27, v4

    int-to-long v3, v11

    goto :goto_24f

    :cond_23e
    move/from16 v25, v3

    move/from16 v27, v4

    iget-object v3, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v3}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v3

    goto :goto_24f

    :cond_249
    move/from16 v25, v3

    move/from16 v27, v4

    const-wide/16 v3, 0x0

    :goto_24f
    const-wide/16 v18, 0x0

    cmp-long v11, v9, v18

    if-lez v11, :cond_2d4

    cmp-long v11, v1, v18

    if-lez v11, :cond_2d4

    const-wide/32 v37, 0x1000000

    cmp-long v11, v1, v37

    if-gtz v11, :cond_2d4

    move/from16 v37, v12

    iget-wide v11, v0, Le/e/a/FragmentedMp4117$Cursor;->decode:J

    invoke-static {v11, v12, v3, v4}, Le/e/a/FragmentedMp4117;->add(JJ)J

    move-result-wide v3

    cmp-long v11, v3, v18

    if-ltz v11, :cond_2cc

    new-instance v11, Le/e/a/FragmentedMp4117$Sample;

    invoke-direct {v11}, Le/e/a/FragmentedMp4117$Sample;-><init>()V

    iput-wide v6, v11, Le/e/a/FragmentedMp4117$Sample;->offset:J

    long-to-int v12, v1

    iput v12, v11, Le/e/a/FragmentedMp4117$Sample;->size:I

    iget-object v12, v0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    move/from16 v38, v13

    iget-wide v12, v12, Le/e/a/FragmentedMp4117$Format;->scale:J

    invoke-static {v3, v4, v12, v13}, Le/e/a/FragmentedMp4117;->micros(JJ)J

    move-result-wide v3

    iput-wide v3, v11, Le/e/a/FragmentedMp4117$Sample;->timeUs:J

    iget-object v3, v0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget-wide v3, v3, Le/e/a/FragmentedMp4117$Format;->scale:J

    invoke-static {v9, v10, v3, v4}, Le/e/a/FragmentedMp4117;->micros(JJ)J

    move-result-wide v3

    iput-wide v3, v11, Le/e/a/FragmentedMp4117$Sample;->durationUs:J

    const-wide/32 v3, 0x10000

    and-long v3, v35, v3

    const-wide/16 v12, 0x0

    cmp-long v3, v3, v12

    if-nez v3, :cond_299

    const/4 v4, 0x1

    goto :goto_29b

    :cond_299
    move/from16 v4, v26

    :goto_29b
    iput-boolean v4, v11, Le/e/a/FragmentedMp4117$Sample;->sync:Z

    iget-object v3, v0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    invoke-virtual {v3, v6, v7, v1, v2}, Le/e/a/FragmentedMp4117;->inMdat(JJ)Z

    move-result v3

    if-eqz v3, :cond_2c4

    iget-object v3, v0, Le/e/a/FragmentedMp4117$Cursor;->samples:Ljava/util/ArrayList;

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v6, v7, v1, v2}, Le/e/a/FragmentedMp4117;->add(JJ)J

    move-result-wide v6

    iget-wide v1, v0, Le/e/a/FragmentedMp4117$Cursor;->decode:J

    invoke-static {v1, v2, v9, v10}, Le/e/a/FragmentedMp4117;->add(JJ)J

    move-result-wide v1

    iput-wide v1, v0, Le/e/a/FragmentedMp4117$Cursor;->decode:J

    add-int/lit8 v8, v8, 0x1

    move/from16 v3, v25

    move/from16 v4, v27

    move-wide/from16 v1, v29

    move/from16 v12, v37

    move/from16 v13, v38

    goto/16 :goto_1ec

    :cond_2c4
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30b5\u30f3\u30d7\u30eb\u306e\u4f4d\u7f6e\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2cc
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u8868\u793a\u6642\u523b\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2d4
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30b5\u30f3\u30d7\u30eb\u9577\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2dc
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u30b5\u30f3\u30d7\u30eb\u60c5\u5831\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2e4
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u30d5\u30e9\u30b0\u30e1\u30f3\u30c8\u304c\u9577\u3059\u304e\u307e\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2ec
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30b5\u30f3\u30d7\u30eb\u306e\u5f62\u5f0f\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2f4
    move-object/from16 v20, v2

    move-object/from16 v28, v3

    move-wide/from16 v31, v8

    move-wide/from16 v33, v10

    const-wide/16 v12, 0x0

    const-wide/16 v16, 0x4

    move-object/from16 v1, p1

    goto/16 :goto_13a

    .line 26
    :cond_304
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30d5\u30e9\u30b0\u30e1\u30f3\u30c8\u8a2d\u5b9a\u304c\u4e0d\u8db3\u3057\u3066\u3044\u307e\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_30c
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u6697\u53f7\u5316\u30b5\u30f3\u30d7\u30eb\u306f\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_314
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30d5\u30e9\u30b0\u30e1\u30f3\u30c8\u60c5\u5831\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_31c
    move-object/from16 v20, v2

    move-object/from16 v1, p1

    goto/16 :goto_12
.end method

.method raw()[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    if-eqz v0, :cond_31

    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->buffer:[B

    array-length v0, v0

    iget-object v1, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget v1, v1, Le/e/a/FragmentedMp4117$Sample;->size:I

    if-ge v0, v1, :cond_15

    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget v0, v0, Le/e/a/FragmentedMp4117$Sample;->size:I

    new-array v0, v0, [B

    iput-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->buffer:[B

    :cond_15
    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v0, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget-wide v1, v1, Le/e/a/FragmentedMp4117$Sample;->offset:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->this$0:Le/e/a/FragmentedMp4117;

    iget-object v0, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Le/e/a/FragmentedMp4117$Cursor;->buffer:[B

    iget-object v2, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget v2, v2, Le/e/a/FragmentedMp4117$Sample;->size:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/RandomAccessFile;->readFully([BII)V

    iget-object v0, p0, Le/e/a/FragmentedMp4117$Cursor;->buffer:[B

    return-object v0

    :cond_31
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method write(Ljava/nio/ByteBuffer;)I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    invoke-virtual {p0}, Le/e/a/FragmentedMp4117$Cursor;->raw()[B

    move-result-object v0

    iget-object v1, p0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget v1, v1, Le/e/a/FragmentedMp4117$Sample;->size:I

    iget-object v2, p0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget-object v2, v2, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    const-string v3, "video/avc"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_73

    move v2, v3

    :goto_16
    if-lt v2, v1, :cond_19

    goto :goto_7c

    :cond_19
    sub-int v4, v1, v2

    iget-object v5, p0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget v5, v5, Le/e/a/FragmentedMp4117$Format;->nalLength:I

    if-lt v4, v5, :cond_6b

    const-wide/16 v4, 0x0

    move v6, v3

    move-wide v7, v4

    :goto_25
    iget-object v9, p0, Le/e/a/FragmentedMp4117$Cursor;->format:Le/e/a/FragmentedMp4117$Format;

    iget v9, v9, Le/e/a/FragmentedMp4117$Format;->nalLength:I

    if-lt v6, v9, :cond_5c

    cmp-long v4, v7, v4

    if-lez v4, :cond_54

    sub-int v4, v1, v2

    int-to-long v4, v4

    cmp-long v4, v7, v4

    if-gtz v4, :cond_54

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    int-to-long v4, v4

    const-wide/16 v9, 0x4

    add-long/2addr v9, v7

    cmp-long v4, v4, v9

    if-ltz v4, :cond_4c

    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    long-to-int v4, v7

    invoke-virtual {p1, v0, v2, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    add-int/2addr v2, v4

    goto :goto_16

    :cond_4c
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u52d5\u753b\u30d5\u30ec\u30fc\u30e0\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_54
    new-instance p1, Ljava/io/IOException;

    const-string v0, "NAL\u9577\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5c
    const/16 v9, 0x8

    shl-long/2addr v7, v9

    add-int/lit8 v9, v2, 0x1

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    int-to-long v10, v2

    or-long/2addr v7, v10

    add-int/lit8 v6, v6, 0x1

    move v2, v9

    goto :goto_25

    :cond_6b
    new-instance p1, Ljava/io/IOException;

    const-string v0, "NAL\u9577\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_73
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-lt v2, v1, :cond_81

    invoke-virtual {p1, v0, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    :goto_7c
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result p1

    return p1

    :cond_81
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u97f3\u58f0\u30d5\u30ec\u30fc\u30e0\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
