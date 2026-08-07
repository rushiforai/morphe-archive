.class public final Ll/l5y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:Landroid/os/Bundle;

.field public final synthetic e:Z

.field public final synthetic f:Z

.field public final synthetic g:Z

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Ljava/lang/String;Ljava/lang/String;JLandroid/os/Bundle;ZZZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/l5y0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/l5y0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-wide p4, p0, Ll/l5y0;->c:J

    .line 6
    .line 7
    iput-object p6, p0, Ll/l5y0;->d:Landroid/os/Bundle;

    .line 8
    .line 9
    iput-boolean p7, p0, Ll/l5y0;->e:Z

    .line 10
    .line 11
    iput-boolean p8, p0, Ll/l5y0;->f:Z

    .line 12
    .line 13
    iput-boolean p9, p0, Ll/l5y0;->g:Z

    .line 14
    .line 15
    iput-object p10, p0, Ll/l5y0;->h:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Ll/l5y0;->i:Lcom/google/android/gms/measurement/internal/g;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/l5y0;->i:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l5y0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/l5y0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v3, p0, Ll/l5y0;->c:J

    .line 8
    .line 9
    iget-object v5, p0, Ll/l5y0;->d:Landroid/os/Bundle;

    .line 10
    .line 11
    iget-boolean v6, p0, Ll/l5y0;->e:Z

    .line 12
    .line 13
    iget-boolean v7, p0, Ll/l5y0;->f:Z

    .line 14
    .line 15
    iget-boolean v8, p0, Ll/l5y0;->g:Z

    .line 16
    .line 17
    iget-object v9, p0, Ll/l5y0;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/gms/measurement/internal/g;->W(Ljava/lang/String;Ljava/lang/String;JLandroid/os/Bundle;ZZZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
