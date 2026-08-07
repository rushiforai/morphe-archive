.class public final synthetic Ll/g3l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o3l0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/e4l0;

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ll/e4l0;ZZLjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g3l0;->a:Ll/o3l0;

    iput-object p2, p0, Ll/g3l0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/g3l0;->c:Ll/e4l0;

    iput-boolean p4, p0, Ll/g3l0;->d:Z

    iput-boolean p5, p0, Ll/g3l0;->e:Z

    iput-object p6, p0, Ll/g3l0;->f:Ljava/lang/String;

    iput p7, p0, Ll/g3l0;->g:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/g3l0;->a:Ll/o3l0;

    iget-object v1, p0, Ll/g3l0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/g3l0;->c:Ll/e4l0;

    iget-boolean v3, p0, Ll/g3l0;->d:Z

    iget-boolean v4, p0, Ll/g3l0;->e:Z

    iget-object v5, p0, Ll/g3l0;->f:Ljava/lang/String;

    iget v6, p0, Ll/g3l0;->g:I

    move-object v7, p1

    check-cast v7, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    invoke-static/range {v0 .. v7}, Ll/o3l0;->f(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ll/e4l0;ZZLjava/lang/String;ILcom/tantanapp/sharedlibrary/loader/LoadEvent;)V

    return-void
.end method
