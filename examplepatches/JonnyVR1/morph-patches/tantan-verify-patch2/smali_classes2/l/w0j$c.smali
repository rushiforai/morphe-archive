.class public final Ll/w0j$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w0j$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w0j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final a:[Ll/w0j$d;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>([Ll/w0j$d;)V
    .locals 0
    .param p1    # [Ll/w0j$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w0j$c;->a:[Ll/w0j$d;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()[Ll/w0j$d;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w0j$c;->a:[Ll/w0j$d;

    .line 2
    .line 3
    return-object p0
.end method
