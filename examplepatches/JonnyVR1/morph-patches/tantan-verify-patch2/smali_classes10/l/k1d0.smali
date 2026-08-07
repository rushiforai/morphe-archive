.class public final synthetic Ll/k1d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ll/q1d0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/nsv;

.field public final synthetic e:Ljava/util/List;

.field public final synthetic f:J

.field public final synthetic g:Z

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Ll/q1d0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;Ljava/util/List;JZLjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1d0;->a:Ll/q1d0;

    iput-object p2, p0, Ll/k1d0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/k1d0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/k1d0;->d:Ll/nsv;

    iput-object p5, p0, Ll/k1d0;->e:Ljava/util/List;

    iput-wide p6, p0, Ll/k1d0;->f:J

    iput-boolean p8, p0, Ll/k1d0;->g:Z

    iput-object p9, p0, Ll/k1d0;->h:Ljava/lang/String;

    iput p10, p0, Ll/k1d0;->i:I

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/k1d0;->a:Ll/q1d0;

    iget-object v1, p0, Ll/k1d0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/k1d0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/k1d0;->d:Ll/nsv;

    iget-object v4, p0, Ll/k1d0;->e:Ljava/util/List;

    iget-wide v5, p0, Ll/k1d0;->f:J

    iget-boolean v7, p0, Ll/k1d0;->g:Z

    iget-object v8, p0, Ll/k1d0;->h:Ljava/lang/String;

    iget v9, p0, Ll/k1d0;->i:I

    move-object v10, p1

    move-object/from16 v11, p2

    move/from16 v12, p3

    move-object/from16 v13, p4

    invoke-static/range {v0 .. v13}, Ll/q1d0;->f(Ll/q1d0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;Ljava/util/List;JZLjava/lang/String;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
