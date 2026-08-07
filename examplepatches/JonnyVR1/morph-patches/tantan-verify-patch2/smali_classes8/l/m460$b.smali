.class public final Ll/m460$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m460;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field static final INSTANCE:Ll/m460;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/m460<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/m460;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ll/m460;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/m460$b;->INSTANCE:Ll/m460;

    .line 8
    .line 9
    return-void
.end method
