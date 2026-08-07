.class public interface abstract Landroidx/work/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/work/d$b;
    }
.end annotation


# static fields
.field public static final a:Landroidx/work/d$b$c;
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public static final b:Landroidx/work/d$b$b;
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/work/d$b$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Landroidx/work/d$b$c;-><init>(Landroidx/work/d$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Landroidx/work/d;->a:Landroidx/work/d$b$c;

    .line 8
    .line 9
    new-instance v0, Landroidx/work/d$b$b;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroidx/work/d$b$b;-><init>(Landroidx/work/d$a;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Landroidx/work/d;->b:Landroidx/work/d$b$b;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public abstract getResult()Ll/hpr;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/hpr<",
            "Landroidx/work/d$b$c;",
            ">;"
        }
    .end annotation
.end method
