.class public final synthetic Ll/yjo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/nsv;

.field public final synthetic c:Ll/fko0;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:J

.field public final synthetic g:Z

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:I

.field public final synthetic j:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/nsv;Ll/fko0;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ILcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yjo0;->a:Ljava/util/List;

    iput-object p2, p0, Ll/yjo0;->b:Ll/nsv;

    iput-object p3, p0, Ll/yjo0;->c:Ll/fko0;

    iput-object p4, p0, Ll/yjo0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/yjo0;->e:Ljava/lang/String;

    iput-wide p6, p0, Ll/yjo0;->f:J

    iput-boolean p8, p0, Ll/yjo0;->g:Z

    iput-object p9, p0, Ll/yjo0;->h:Ljava/lang/String;

    iput p10, p0, Ll/yjo0;->i:I

    iput-object p11, p0, Ll/yjo0;->j:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 15

    .line 1
    iget-object v0, p0, Ll/yjo0;->a:Ljava/util/List;

    iget-object v1, p0, Ll/yjo0;->b:Ll/nsv;

    iget-object v2, p0, Ll/yjo0;->c:Ll/fko0;

    iget-object v3, p0, Ll/yjo0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/yjo0;->e:Ljava/lang/String;

    iget-wide v5, p0, Ll/yjo0;->f:J

    iget-boolean v7, p0, Ll/yjo0;->g:Z

    iget-object v8, p0, Ll/yjo0;->h:Ljava/lang/String;

    iget v9, p0, Ll/yjo0;->i:I

    iget-object v10, p0, Ll/yjo0;->j:Lcom/p1/mobile/android/app/Act;

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move/from16 v13, p3

    move-object/from16 v14, p4

    invoke-static/range {v0 .. v14}, Ll/fko0;->d(Ljava/util/List;Ll/nsv;Ll/fko0;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ILcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
