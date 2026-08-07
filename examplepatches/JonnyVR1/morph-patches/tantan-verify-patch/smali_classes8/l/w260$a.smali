.class public final Ll/w260$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w260;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final INSTANCE:Ll/w260;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/w260<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/w260;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w260;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/w260$a;->INSTANCE:Ll/w260;

    .line 7
    .line 8
    return-void
.end method
