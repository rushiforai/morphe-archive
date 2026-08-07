.class public final Ll/w360$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w360;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# static fields
.field static final INSTANCE:Ll/w360;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/w360<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/w360;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w360;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/w360$c;->INSTANCE:Ll/w360;

    .line 7
    .line 8
    return-void
.end method
