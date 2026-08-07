.class public final Ll/d460$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d460;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field static final INSTANCE:Ll/d460;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/d460<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/d460;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d460;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/d460$b;->INSTANCE:Ll/d460;

    .line 7
    .line 8
    return-void
.end method
