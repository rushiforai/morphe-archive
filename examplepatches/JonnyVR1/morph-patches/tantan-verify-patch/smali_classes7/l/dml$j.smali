.class public abstract Ll/dml$j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "j"
.end annotation


# static fields
.field public static final a:Ll/dml$j;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/dml$j$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dml$j$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/dml$j;->a:Ll/dml$j;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e(Ll/dml;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract f(Ll/gml;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
