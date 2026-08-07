.class public Ll/s7y;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Landroid/os/Bundle;

.field public final c:Landroid/os/Bundle;

.field public final d:Landroid/content/Context;

.field public final e:Z

.field public final f:I

.field public final g:I

.field public final h:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZLandroid/location/Location;IILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Landroid/location/Location;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/s7y;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Ll/s7y;->b:Landroid/os/Bundle;

    .line 7
    .line 8
    iput-object p4, p0, Ll/s7y;->c:Landroid/os/Bundle;

    .line 9
    .line 10
    iput-object p1, p0, Ll/s7y;->d:Landroid/content/Context;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/s7y;->e:Z

    .line 13
    .line 14
    iput p7, p0, Ll/s7y;->f:I

    .line 15
    .line 16
    iput p8, p0, Ll/s7y;->g:I

    .line 17
    .line 18
    iput-object p9, p0, Ll/s7y;->h:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p10, p0, Ll/s7y;->i:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method
