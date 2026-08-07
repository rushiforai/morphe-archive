.class public interface abstract Ll/ce1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/ce1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/be1;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/be1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ce1;->a:Ll/ce1;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/nnd0;Ll/i5d0;)Ll/x1d0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method


# virtual methods
.method public abstract b(Ll/nnd0;Ll/i5d0;)Ll/x1d0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
