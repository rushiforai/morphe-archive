.class public Ll/e4k0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/se00;
.implements Ll/e4k0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e4k0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/se00<",
        "Landroid/net/Uri;",
        "Landroid/os/ParcelFileDescriptor;",
        ">;",
        "Ll/e4k0$c<",
        "Landroid/os/ParcelFileDescriptor;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e4k0$b;->a:Landroid/content/ContentResolver;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/net/Uri;)Ll/t5c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ll/t5c<",
            "Landroid/os/ParcelFileDescriptor;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rii;

    .line 2
    .line 3
    iget-object p0, p0, Ll/e4k0$b;->a:Landroid/content/ContentResolver;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/rii;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public b(Ll/qs10;)Ll/re00;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qs10;",
            ")",
            "Ll/re00<",
            "Landroid/net/Uri;",
            "Landroid/os/ParcelFileDescriptor;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/e4k0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/e4k0;-><init>(Ll/e4k0$c;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method
