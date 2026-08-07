.class public final Ll/v360$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v360;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field static final INSTANCE:Ll/v360;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v360<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/v360;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/v360;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/v360$b;->INSTANCE:Ll/v360;

    .line 7
    .line 8
    return-void
.end method
